describe('jungle-rails app', () => {
  
  describe('successfully loads the home page and clicks on the add to cart', () => {
    it('successfully loads the home page', () => {
      cy.visit('http://localhost:3000')
       // change URL to match your dev URL
    })
    
    it("successfully clicks on the add to cart", () => {
      cy.get(".products article").should("be.visible");
      cy.get(".products article .btn" ).first().click({force: true})
      
      cy.get(".end-0").should("contain","(1)")
    });

    
  })
 
})