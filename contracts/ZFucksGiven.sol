pragma solidity ^0.4.24;
import "./IZFucksGiven.sol";
import "./SafeMath.sol";
import "./Owned.sol";

contract ZFucksGiven is IZFucksGiven, SafeMath, Owned {

        string public symbol;
        string public name;
        uint8 public decimals;
        uint public _totalSupply;

        mapping (address=>uint) balances;
        mapping (address=>mapping(address=>uint)) allowed;
       
        constructor () public {
              symbol = "Z_FUCK";
              name = "ZFuck";
              decimals = 18;
              _totalSupply = 5;
              balances[msg.sender] = _totalSupply;
              emit Transfer(address(0), msg.sender, _totalSupply);
        }

        function totalSupply() public view returns (uint){
            return _totalSupply - balances[address(0)];
        }

        function balanceOf(address tokenOwner) public view returns (uint balance){
            return balances[tokenOwner];
        }

        function allowance(address tokenOwner, address spender) public view returns (uint remaining){
            return allowed[tokenOwner][spender];
        }

        function transfer(address to, uint tokens) public returns (bool success) {
            require(balances[msg.sender] >= tokens, 
            "Not enough money");

            balances[to] = safeAdd(balances[to], tokens);
            balances[msg.sender] = safeSub(balances[msg.sender], tokens);

            emit Transfer(msg.sender, to, tokens);

            return true;
        }

        function approve(address spender, uint tokens) public returns (bool success) {
            allowed[msg.sender][spender] = tokens;
            emit Approval(msg.sender, spender, tokens);
            return true;
        }

        function transferFrom(address from, address to, uint tokens) public returns (bool success) {
            require(balances[from] >= tokens, "Not enough money in the from address");
            allowed[from][msg.sender] = safeSub(allowed[from][msg.sender], tokens);
            
            balances[from] = safeSub(balances[from], tokens);
            balances[to] = safeAdd(balances[to], tokens);
            
            emit Transfer(from, to, tokens);
            
            return true;
        }
}