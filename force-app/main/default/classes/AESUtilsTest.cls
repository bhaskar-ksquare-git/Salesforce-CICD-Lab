/**
 * @description Test class for AESUtils
 * @group Test
 */
@isTest
public with sharing class AESUtilsTest {

    /**
     * @description Test method for encrypting and decrypting data using AES 256
     */
    @isTest
    static void testEncryptDecrypt() {
        Blob dataToBeEncrypted = Blob.valueOf('Hello World, new pipeline! this should work');
        Blob key = Crypto.generateAesKey(256);
        System.Test.startTest();
        String encryptedData = AESUtils.encryptAES256(key, dataToBeEncrypted);
        String decryptedData = AESUtils.decryptAES256(key, encryptedData);
        System.Test.stopTest();

        Assert.areEqual('Hello World, new pipeline! this should work', decryptedData, 'Decrypted data is not the same as original data');
    }
}