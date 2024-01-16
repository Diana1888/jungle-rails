describe('Add to cart', () => {
  
  it('allows users to add product to cart on the home page so the cart increases by one', () => {

    cy.visit("http://localhost:3000/");
    
    cy.get(".btn").contains('Add').click({ force: true });

    cy.contains("My Cart (1)").should("exist");

    });
});