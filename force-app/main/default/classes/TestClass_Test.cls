@isTest
private class TestClass_Test {

    @isTest
    static void testConstructor() {
        Test.startTest();
        TestClass instance = new TestClass();
        Test.stopTest();

        System.assertNotEquals(null, instance, 'TestClass instance should not be null');
    }

    @isTest
    static void testGreetWithName() {
        TestClass tc = new TestClass();
        Test.startTest();
        String result = tc.greet('Charan');
        Test.stopTest();

        System.assertEquals('Hello, Charan!', result, 'Should return greeting with name');
    }

    @isTest
    static void testGreetWithBlankName() {
        TestClass tc = new TestClass();
        Test.startTest();
        String result = tc.greet('');
        Test.stopTest();

        System.assertEquals('Hello, World!', result, 'Should return default greeting for blank name');
    }

    @isTest
    static void testAdd() {
        TestClass tc = new TestClass();
        Test.startTest();
        Integer result = tc.add(3, 7);
        Test.stopTest();

        System.assertEquals(10, result, 'Should return the sum of two integers');
    }

    @isTest
    static void testIsEvenTrue() {
        TestClass tc = new TestClass();
        Test.startTest();
        Boolean result = tc.isEven(4);
        Test.stopTest();

        System.assertEquals(true, result, '4 should be even');
    }

    @isTest
    static void testIsEvenFalse() {
        TestClass tc = new TestClass();
        Test.startTest();
        Boolean result = tc.isEven(7);
        Test.stopTest();

        System.assertEquals(false, result, '7 should not be even');
    }

    @isTest
    static void testFilterPositives() {
        TestClass tc = new TestClass();
        List<Integer> input = new List<Integer>{ -3, 0, 5, -1, 8 };
        Test.startTest();
        List<Integer> result = tc.filterPositives(input);
        Test.stopTest();

        System.assertEquals(2, result.size(), 'Should return only positive numbers');
        System.assertEquals(5, result[0], 'First positive should be 5');
        System.assertEquals(8, result[1], 'Second positive should be 8');
    }
}
