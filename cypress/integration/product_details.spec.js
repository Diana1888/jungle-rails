describe('Product detail page', () => {
  it('allows users to navigate from the home page to the product detail page by clicking on a product', () => {

    cy.visit("http://localhost:3000/");

    cy.get('article').first().click();
    cy.url().should('include', '/products/');
    });
});