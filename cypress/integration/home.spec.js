
it("There is 12 products on the page", () => {
  cy.visit('http://localhost:3000/');
  cy.get(".products article").should("have.length", 12);
});