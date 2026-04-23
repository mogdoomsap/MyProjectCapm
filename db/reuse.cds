namespace com.reuse;

//reusable type across all files
type Guid:String(30);

//aspect is like a structure
aspect address{
    street:String(30);
    city:String(30);
    country:String(30);
    
}