component {
    property name="loader" inject="Loader@spotlessCF";

    function init(){
        return this;
    }

    function formatSQL( required string source ){
        return loader.getSQLFormatter().format( arguments.source );
    }
}