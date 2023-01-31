

describe('jungle-rails app', () => {
  
  describe('successfully loads the home and clicks on the product to load the product page', () => {
    it('successfully loads', () => {
      cy.visit('http://localhost:3000')
       cy.get(".products article").first().click()// change URL to match your dev URL
    })
    
    it('successfully loads product page', () => {
      cy.visit('http://localhost:3000/products/1')
       // change URL to match your dev URL
    })

  })
 
})