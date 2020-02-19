//ERC721BSU-MEMPAD.sol
//https://github.com/0xcert/ethereum-erc721
//rinkeby  0x219041Bd1FD391F189535cdc32f929b33D1309b5
//by  0x0f398803BE4319B98F164cae47589797aC5cF906
//dapps

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

  /**
   * @dev Contract constructor. Sets metadata extension `name` and `symbol`.
   */
  constructor()
    public
  {
    nftName = "ERC721-NFT-Rewritable-MEMOPAD";
    nftSymbol = "NF-RWPAD";
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
    
   /**
   * @dev Rewrite TokenURI a NFT from owner. ( creator.)
   * @param _tokenId Which NFT we want to remove.(burn)
   */
  function setTokenUri(
    uint256 _tokenId,
    string calldata _uri
  )
    external
    onlyOwner
    validNFToken(_tokenId)
  {
    idToUri[_tokenId] = _uri;
  } 
    
}
