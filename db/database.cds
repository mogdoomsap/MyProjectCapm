namespace com.practice;
using { com.reuse } from './reuse';
using { cuid,temporal,managed } from '@sap/cds/common';


context master{
 entity student :reuse.address{
  key id: reuse.Guid;
  name: String(30);
  class:Association to semester;
  backlog: Boolean;
  age:Int16;

 }
 entity semester{
    key id:reuse.Guid;
    semester : String(40);
    specialization:String(50);
    hod:String(50);
 }
 entity book{
    key id:reuse.Guid;
    name:String(30);
    author:String(50);
 }

}

context trans{
    entity subscription: cuid,temporal,managed{
       student:Association to one master.student;
       book:Association to one master.book;
        validFrom: Date not null default current_date;
        validTo: Date not null default current_date;

    }
}