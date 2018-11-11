({
    emitEvent : function(component,event,helper){
        var event = component.getEvent("c:Event");
        event.setParams({myEventData : "Test data."});
        event.fire();
    }
})