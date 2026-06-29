@isTest
private class AccountHelperTest {

    @TestSetup
    static void setupData() {
        List<Account> accounts = new List<Account>{
            new Account(Name = 'Tech Corp', Industry = 'Technology', Phone = '555-0001'),
            new Account(Name = 'Cloud Soft', Industry = 'Technology', Phone = '555-0002'),
            new Account(Name = 'Finance Plus', Industry = 'Finance', Phone = '555-0003')
        };
        insert accounts;
    }

    @isTest
    static void testCreateAccount_success() {
        Test.startTest();
        Account acc = AccountHelper.createAccount('New Co', 'Healthcare', '555-9999');
        Test.stopTest();

        System.assertNotEquals(null, acc.Id, 'Account should have been inserted');
        Account queried = [SELECT Name, Industry, Phone FROM Account WHERE Id = :acc.Id];
        System.assertEquals('New Co', queried.Name);
        System.assertEquals('Healthcare', queried.Industry);
        System.assertEquals('555-9999', queried.Phone);
    }

    @isTest
    static void testCreateAccount_blankName_throws() {
        Test.startTest();
        try {
            AccountHelper.createAccount('', 'Technology', '555-0000');
            System.assert(false, 'Expected exception was not thrown');
        } catch (IllegalArgumentException e) {
            System.assertEquals('Account name cannot be blank', e.getMessage());
        }
        Test.stopTest();
    }

    @isTest
    static void testGetAccountsByIndustry() {
        Test.startTest();
        List<Account> techAccounts = AccountHelper.getAccountsByIndustry('Technology');
        Test.stopTest();

        System.assertEquals(2, techAccounts.size(), 'Should return 2 Technology accounts');
        System.assertEquals('Cloud Soft', techAccounts[0].Name);
        System.assertEquals('Tech Corp', techAccounts[1].Name);
    }

    @isTest
    static void testUpdateAccountPhone() {
        Account acc = [SELECT Id FROM Account WHERE Name = 'Tech Corp' LIMIT 1];

        Test.startTest();
        AccountHelper.updateAccountPhone(acc.Id, '999-0000');
        Test.stopTest();

        Account updated = [SELECT Phone FROM Account WHERE Id = :acc.Id];
        System.assertEquals('999-0000', updated.Phone);
    }

    @isTest
    static void testDeleteAccount() {
        Account acc = [SELECT Id FROM Account WHERE Name = 'Finance Plus' LIMIT 1];

        Test.startTest();
        AccountHelper.deleteAccount(acc.Id);
        Test.stopTest();

        List<Account> remaining = [SELECT Id FROM Account WHERE Id = :acc.Id];
        System.assertEquals(0, remaining.size(), 'Account should have been deleted');
    }

    @isTest
    static void testCountAccountsByIndustry() {
        Test.startTest();
        Integer techCount = AccountHelper.countAccountsByIndustry('Technology');
        Integer financeCount = AccountHelper.countAccountsByIndustry('Finance');
        Test.stopTest();

        System.assertEquals(2, techCount);
        System.assertEquals(1, financeCount);
    }
}
