component accessors="true" {

    public component function init(){
        return this;
    }

    public any function getSQLFormatter(){
        return loadClass( "com.diffplug.spotless.sql.DBeaverSQLFormatter" );
    }
    
    /**
     * Test for spotless availability and throw an error if not available.
     * Used in module initialization.
     */
    public function loadClass( required string className ){
        try {
            return initSpotless( arguments.className);
        } catch( any exception ){
            throw(
                message      = "Cannot load Spotless.Formatter class; is the Spotless jar loaded?",
                type         = "spotlessCF.MissingJarException",
                detail       = "Trying to load #arguments.className# gave us an exception: #exception.message#",
                extendedInfo = serializeJSON( exception )
            );
        }
    }

    private any function initSpotless( required string className ){
        return createObject(
            type = "java",
            className = arguments.className
        );
    }
}