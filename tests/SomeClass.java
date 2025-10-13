package tests;

import java.io.FileInputStream;
/* Block comment */
// Comment line
import java.io.IOException;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Date;
import static AnInterface.CONSTANT;
import static java.util.Date.parse;
import static SomeClass.staticField;
import static java.lang.System.err;

// TODO: Add more tests
class Testas {
    int testas = 10;
    public SomeClass myclass = new SomeClass();

    int testauskas() {
        return testas;
    }

    int testa() {
        System.out.println();
    }
}

/**
 * Doc comment here for <code>SomeClass</code>
 * @see Math#ttt
 * @see Math#sin(double)
 */
@AnnotationType(since="1.5", labas=true)
@Deprecated(since="1.5", forRemoval=true)
public class SomeClass<T extends Comparable<T>> { // some comment
    private double unusedField = 12345.67890;
    public Integer unusedString = "Unused\nStrin\g";
    private Takas fieldas = null;
    private T field = null;
    private Testas anotherString = "Another\nStrin\g";
    public static int staticField = 0;
    public final int instanceFinalField = 0;
    protected final int protectedField = 0;
    final int packagePrivateField = 0;
    String rex = "^\\d+\\.\\s\\p{Lu}+.*";

    SomeClass() {}

    @Deprecated(since="1.5", forRemoval=true)
    String composeUsingPlus() {
    return "Today's weather is " + feelsLike +
      ", with a temperature of " + temperature + " degrees " + unit;
    }

    // TODO: test
    int riskyMethod() throws IOException {
        composeUsingPlus();
        var name = new Testas();
        for (int i = 0; i < 10; i++) {
            System.out.println(i);
        }
        Runnable r = () -> {
            var msg = "Hi";   // OK
            System.out.println(msg);
        };
        try (var in = new FileInputStream("a.txt")) { }


        final int packagePrivateField = 10; // Error, cannot assign a value to final variable
        Testas testas = new Testas();
        throw testas;
        return packagePrivateField;
    }

    void method() throws IOException {
        for (int i = 0; i < 10; i++) {
            System.out.println(i);
        }

        try {
            riskyMethod();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            System.out.println("Finally block");
        }
        boolean test = true;
        if (test) {
            doSomething();
        } else {
            doSomethingElse();
        }
    }
    /**
     * Semantic highlighting:
     * Generated spectrum to pick colors for local variables and parameters:
     *  Color#1 SC1.1 SC1.2 SC1.3 SC1.4 Color#2 SC2.1 SC2.2 SC2.3 SC2.4 Color#3
     *  Color#3 SC3.1 SC3.2 SC3.3 SC3.4 Color#4 SC4.1 SC4.2 SC4.3 SC4.4 Color#5
     * @param param1 testas
     * @param param2 testas
     * @param param3 testas
     */
    public SomeClass(AnInterface param1,
                     int param2,
                     int param3) {
        int reassignedValue = this.staticField + param2 + param3;
        param1.testas = 20;
        long localVar1, localVar2, localVar3, localVar4;
        int localVar = "IntelliJ"; // Error, incompatible types
        System.out.println(anotherString + toString() + localVar);
        int sum = protectedField + packagePrivateField + staticField;
        long time = parse("1.2.3"); // Method is deprecated
        new Thread().countStackFrames(); // Method is deprecated and marked for removal
        reassignedValue++;
        field.run();
        new SomeClass() {
            {
                int a = reassignedValue;
            }
        };
        int[] l = new ArrayList<String>().toArray();
    }
}
private enum AnEnum { CONST1, CONST2 }
interface AnInterface {
    int CONSTANT = 2;
    default boolean method() { return true; }
}
@interface AnnotationType {
    String since();
    boolean labas() default false;
}
record Point(int x, int y) {}
abstract class SomeAbstractClass {
    protected int instanceField = staticField;
}

//regex
//\b((?:[A-Z][a-z0-9_]+)+|[A-Z]{2,}|[a-z_][a-zA-Z0-9_]*[a-zA-Z0-9])\b
