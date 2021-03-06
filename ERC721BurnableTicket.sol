//ERC721Burnable.sol
//https://github.com/0xcert/ethereum-erc721
//rinkeby 
//by 

pragma solidity 0.6.2;

import "https://github.com/0xcert/ethereum-erc721/src/contracts/tokens/nf-token.sol";
import "https://github.com/0xcert/ethereum-erc721/src/contracts/tokens/nf-token-metadata.sol";
import "https://github.com/0xcert/ethereum-erc721/src/contracts/tokens/nf-token-enumerable.sol";
import "https://github.com/0xcert/ethereum-erc721/src/contracts/ownership/ownable.sol";


/**
 * @dev This is an example contract implementation of NFToken with metadata extension.
 */
contract MyERC721 is
  NFTokenMetadata,
  Ownable
{

    //Creator data
    string private _creatorData = "K.N";
    
    //Site
    string private _creatorSitePassWord1 = "123456789";//FirstPassword
    string private _creatorSiteAddress1 = "https://15390372.official/code9";//example
    
    
    //enableSwitch
    bool _enableFlag = true ; 
    
    //site section setter getter
    function setSitePassword1(string memory _newPassword) public onlyOwner {
        _creatorSitePassWord1 = _newPassword ; 
    } 
    function getSitePassword1() public view returns (string memory) {
        require(msg.sender != address(0), ZERO_ADDRESS);
        
        //ファンサイト入場できるトークンを持っているか確認する
        require( _getOwnerNFTCount(msg.sender) > 0 );
        //条件通りならばクリエイターのセットしたパスワードをリターンする
        return _creatorSitePassWord1;
    }
    
    //address setter getter
    function setSiteAddress1(string memory _newAddress) public onlyOwner {
        _creatorSiteAddress1 = _newAddress ; 
    } 
    function getSiteAddress1() public view  returns (string memory) {
        require(msg.sender != address(0), ZERO_ADDRESS);
        require( _getOwnerNFTCount(msg.sender) > 0 );
        return _creatorSiteAddress1; 
    }


    function getCreatorData() public view onlyOwner returns (string memory) {
        return _creatorData; 
    }
    
    //このコントラクトが有効か無効か。この契約は無効かどうか決めるフラグ
    function setFlag(bool _newFlag) public onlyOwner {
        _enableFlag = _newFlag ; 
    }
    function isThisERC20Enable() public view returns (bool) {
        return _enableFlag; 
    }






  /**
   * @dev Contract constructor. Sets metadata extension `name` and `symbol`.
   */
  constructor()
    public
  {
    nftName = "ERC721-NFT-Ticket";
    nftSymbol = "NF-TCKT";
  }
   /**
   * @dev Removes a NFT from owner.
   * @param _tokenId Which NFT we want to remove.(burn)
   */
  function burn(
    uint256 _tokenId
  )
    external
    onlyOwner
  {
    super._burn(_tokenId);
  }
  
  /**
   * @dev Mints a new NFT.
   * @param _to The address that will own the minted NFT.
   * @param _tokenId of the NFT to be minted by the msg.sender.
   * @param _uri String representing RFC 3986 URI.
   */
  function mint(
    address _to,
    uint256 _tokenId,
    string calldata _uri
  )
    external
    onlyOwner
  {
    super._mint(_to, _tokenId);
    super._setTokenUri(_tokenId, _uri);
  }
  
//////////////////    
}

