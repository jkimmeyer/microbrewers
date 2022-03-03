describe('The Home Page', () => {
  it('successfully loads', () => {
    cy.visit('/');
    cy.get('#navigation').contains('Microbrewers');
  });
});
