/**
 * @description This class is used to encrypt and decrypt data using AES 256 algorithm, this class will have a ton of test commits
 * @group Crypto
 */
public class AESUtils {
    private static final String AES_256_ALGORITHM = 'AES256';

    /**
     * @description This method is used to encrypt data using AES 256 algorithm
     * @param aESKey - AES key
     * @param dataToBeEncrypted - Data to be encrypted
     * @return Encrypted data in string base64 format
     */
	public static String encryptAES256(Blob aESKey, Blob dataToBeEncrypted) {
        Blob encrypted = Crypto.encryptWithManagedIV(AES_256_ALGORITHM, aESKey, dataToBeEncrypted);

        return EncodingUtil.base64Encode(encrypted);
    }

    /**
     * @description This method is used to decrypt data using AES 256 algorithm
     * @param aESKey - AES key
     * @param dataToBeDecrypted - Data to be decrypted
     * @return Decrypted data in plain string format
     */
    public static String decryptAES256(Blob aESKey, String dataToBeDecrypted) {
        Blob dataToBeDecryptedBlob = EncodingUtil.base64Decode(dataToBeDecrypted);
        Blob decrypted = Crypto.decryptWithManagedIV(AES_256_ALGORITHM, aESKey, dataToBeDecryptedBlob);
        System.debug('Test Change');
        return decrypted.toString();
    }
}