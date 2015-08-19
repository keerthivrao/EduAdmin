function KeyValueDefinition( name, value )
{
    this.name = name;
    this.value = value;
}
function Map()
{
    this.array = new Array();
}
Map.prototype.put = function( key, value )
{
	if(key && value)
    {
		var keyIndex = this.getKeyIndex(key);
		if( keyIndex == -1)
			keyIndex = this.array.length;
        this.array[keyIndex] = new KeyValueDefinition( key, value );
    }
}
Map.prototype.getKeyIndex = function( key )
{
    for( var index = 0 ; index < this.array.length ; index++ )
    {
        if( this.array[index].name == key ) {
            return index;
        }
    }
    return -1;
}
Map.prototype.get = function( key )
{
    for( var index = 0 ; index < this.array.length ; index++ )
    {
		if( this.array[index].name == key ) {
			return this.array[index].value;
        }
    }
    return "";
}
Map.prototype.length = function()
{
    return this.array.length;
}