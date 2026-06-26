public with sharing class TestClass {
    public TestClass() {
    }

    public String greet(String name) {
        if (String.isBlank(name)) {
            return 'Hello, World!';
        }
        return 'Hello, ' + name + '!';
    }

    public Integer add(Integer a, Integer b) {
        return a + b;
    }

    public Boolean isEven(Integer number) {
        return Math.mod(number, 2) == 0;
    }

    public List<Integer> filterPositives(List<Integer> numbers) {
        List<Integer> result = new List<Integer>();
        for (Integer n : numbers) {
            if (n > 0) {
                result.add(n);
            }
        }
        System.debug('Filtered positives: ' + result);
        return result;
    }
}