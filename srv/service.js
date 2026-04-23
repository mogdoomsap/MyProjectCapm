const cds = require('@sap/cds');
const {employees} = cds.entities("anubhav.db.master");
module.exports = function(srv){
    //It is like a DPC Extension class 
    srv.on('hello', function(req,res){
      let name =req.data.name
      return "hello" +name;
    });

    srv.on('READ','ReadEmployee', async(req)=>{
      let result =[];
      //Example 1 - showing a hardcoded value
       result.push({'ID':'Dummy','nameFirst':'Trial','nameLast':'Service'});
         
       //Example 2 
       
   result = await cds.tx(req).run(
      SELECT.from(employees).limit(10)
    );

      //result = cds.tx(req).run(SELECT.from(employees).limit(10))

//Example 3 get record by where
  
result = await cds.tx(req).run(SELECT.from(employees).limit(10).where({
  salaryAmount:{'>=':30000}}))

  // To get the total salary whose salary is more then 30000
      var tot=0;
      for (let i = 0; i < result.length; i++) {
        const element = result[i];
        tot = tot + parseInt(element.salaryAmount)
      }
      result.splice(1,0,{
        "ID":"Total","salaryAmount":tot
      })
       return result;
    })
}