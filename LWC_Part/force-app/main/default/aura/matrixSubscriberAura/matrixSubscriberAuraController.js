({
    handleMovieData : function(component, event, helper) {
        if (event != null && event.getParams != null) {
            let params = event.getParams();
            component.set("v.movieDataasd", JSON.stringify(params));
        }
    }
})