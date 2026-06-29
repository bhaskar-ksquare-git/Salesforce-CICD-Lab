public with sharing class AccountHelper {

    public static Account createAccount(String name, String industry, String phone) {
        if (String.isBlank(name)) {
            throw new IllegalArgumentException('Account name cannot be blank');
        }
        Account acc = new Account(
            Name = name,
            Industry = industry,
            Phone = phone
        );
        insert acc;
        return acc;
    }

    public static List<Account> getAccountsByIndustry(String industry) {
        return [
            SELECT Id, Name, Industry, Phone
            FROM Account
            WHERE Industry = :industry
            ORDER BY Name ASC
        ];
    }

    public static void updateAccountPhone(Id accountId, String newPhone) {
        Account acc = [SELECT Id, Phone FROM Account WHERE Id = :accountId LIMIT 1];
        acc.Phone = newPhone;
        update acc;
    }

    public static void deleteAccount(Id accountId) {
        Account acc = [SELECT Id FROM Account WHERE Id = :accountId LIMIT 1];
        delete acc;
    }

    public static Integer countAccountsByIndustry(String industry) {
        return [SELECT COUNT() FROM Account WHERE Industry = :industry];
    }
}
