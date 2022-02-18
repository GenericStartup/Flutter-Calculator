package com.genericstartup.CalculatorApp.api;

import com.genericstartup.CalculatorApp.model.CalculationResult;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

@RequestMapping("api/calculator")
@RestController
public class CalculatorController {

    @GetMapping(path = "calculate/{expression}")
    @CrossOrigin
    public CalculationResult getCalculationResult(@PathVariable("expression") String expression) throws ScriptException {
        ScriptEngineManager mgr = new ScriptEngineManager();
        ScriptEngine engine = mgr.getEngineByName("JavaScript");
        return new CalculationResult(String.valueOf(engine.eval(expression)));
    }
}
