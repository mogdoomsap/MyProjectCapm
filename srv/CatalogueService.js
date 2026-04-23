const cds = require('@sap/cds');
module.exports= cds.service.impl(async function(){
   const {POS , EmployeeSet} = this.entities;
 this.before('UPDATE',EmployeeSet, (req)=> {
     if(parseFloat(req.data.salaryAmount) >= 1000000)
        req.error(500,"Requested Salary is not allowed")
    })

    this.on('getOrderDefaults',(req,res) =>{
       return{
        'OVERALL_STATUS':'N'
       };
    })

    this.on('setOrderProcessing', POS, async req =>{
     const tx=cds.tx(req);
     await tx.update(POS, req.params[0].ID).set({
        OVERALL_STATUS:'A'
     });
    })

   this.on('boost', async function(req,res){
    try {
        const ID=req.params[0];
        console.log("ID is: ",JSON.stringify(ID));
        const tx= cds.tx(req);
        await tx.update(POS).with({
            GROSS_AMOUNT: {'+=' :20000}
        }).where(ID);
        
    } catch (error){
        return "Error" + error.toString();

    }
   });
   this.on('getLargestOrder', async function(req,res){
    try {
          const tx= cds.tx(req);
        const reply = await tx.read(POS).orderBy({
            GROSS_AMOUNT:'desc' 
        }).limit(1);

        return reply;
    } catch (error) {
        
    }
   })
})