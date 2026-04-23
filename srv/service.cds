using { anubhav.db.master } from '../db/datamodel';

service MyService @(path:'MyService'){
    function hello(name:String) returns String;
    
   @readonly
    entity ReadEmployee as projection on master.employees;
}