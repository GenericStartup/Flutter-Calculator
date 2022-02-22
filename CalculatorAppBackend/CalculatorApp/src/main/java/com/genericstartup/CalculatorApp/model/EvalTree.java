package com.genericstartup.CalculatorApp.model;


public class EvalTree{
    private EvalFunc func;
    private EvalTree left;
    private EvalTree right;
    private double value;

    public enum EvalFunc {
        ADD,
        SUB,
        MUL,
        DIV,
        MOD,
        CONST,
    }


    public EvalTree(EvalFunc func, EvalTree left, EvalTree right, double value){
        this.func = func;
        this.left = left;
        this.right = right;
        this.value = value;
    }


    public double Eval(){
        switch(this.func){
            case ADD:
              this.value = this.left.Eval() + this.right.Eval();
              break;
            case SUB:
              this.value = this.left.Eval() - this.right.Eval();
              break;
            case MUL:
              this.value = this.left.Eval() * this.right.Eval();
              break;
            case DIV:
              this.value = this.left.Eval() / this.right.Eval();
              break;
            case MOD:
              this.value = this.left.Eval() % this.right.Eval();
              break;
            case CONST:
              break;
        }
        return this.value;
    }
    


    public static EvalTree generate(String exp){
        System.out.println(exp);
        EvalTree leftTree = null;
        EvalTree rightTree = null;
        EvalFunc expFunc = EvalFunc.CONST;

        boolean foundOperator = false;

        for(int i=exp.length()-1; i >= 0 && foundOperator == false; i--){
            switch(exp.charAt(i)){
                case '+':
                  expFunc = EvalFunc.ADD;
                  break;
                case '-':
                  expFunc = EvalFunc.SUB;
                  break;
            }
            switch(exp.charAt(i)){
                case '+':
                case '-':
                    foundOperator = true;
                    leftTree = generate(exp.substring(0,i));
                    rightTree = generate(exp.substring(i+1));
            }
        }
        for(int i=exp.length()-1; i >= 0 && foundOperator == false; i--){
            switch(exp.charAt(i)){
                case '*':
                  expFunc = EvalFunc.MUL;
                  break;
                case 'd':
                  expFunc = EvalFunc.DIV;
                  break;
                case '%':
                  expFunc = EvalFunc.MOD;
                  break;
            }
            switch(exp.charAt(i)){
                case '*':
                case 'd':
                case '%':
                    foundOperator = true;
                    leftTree = generate(exp.substring(0,i));
                    rightTree = generate(exp.substring(i+1));
            }
        }
        if(foundOperator == false){
            return new EvalTree(EvalFunc.CONST, null, null, Double.valueOf(exp));
        }
        return new EvalTree(expFunc, leftTree, rightTree, 0.0d);
    }
}
