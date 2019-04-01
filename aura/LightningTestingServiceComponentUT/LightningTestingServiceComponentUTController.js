({
    myTestMethod : function(component, event, helper){
        return '123';
    },

    myTestServerMethod : function(component, event, helper){
        var action = component.get("v.getSomething");
        action.setCallback(this,function(response){
            component.set("v.myServerAttribute",response.getReturnValue());
        });
    }

})