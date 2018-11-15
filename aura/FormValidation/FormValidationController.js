({
    validate : function(component, event, helper){
        var input1 = component.find("input1");
        var input1Value = input1.get("v.value");

        if(input1Value == "valid value"){
            input1.setCustomValidity("");
            input1.reportValidity();
        } else{
            input1.setCustomValidity("Error message or blank if valid");
            input1.reportValidity();
        }
    }

})