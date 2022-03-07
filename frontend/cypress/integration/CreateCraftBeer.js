describe('Create a CraftBeer', () => {
  beforeEach(() => {
    cy.loginViaAPI('Brewery');
    cy.validateToken('Brewery');
  });

  it('displays the page', () => {
    cy.intercept(
      'GET',
      '/api/v1/craft_beer_types',
      {
        body: [
          { id: 1, name: 'Stout' },
          { id: 2, name: 'Belgian And French Ale' },
        ],
      },
    );

    cy.visit('/craft_beers/new');
    cy.contains('Erstelle ein neues Craft Bier!');
    cy.contains('Craft-Bier speichern');
    cy.contains('Vorschau - Detailansicht');
  });

  context('with valid data', () => {
    it('updates the preview', () => {
      cy.intercept(
        'GET',
        '/api/v1/craft_beer_types',
        {
          body: [
            { id: 1, name: 'Stout' },
            { id: 2, name: 'Belgian And French Ale' },
          ],
        },
      );

      cy.visit('/craft_beers/new');
      cy.get('#input-name').type('Brewer\'s Summer Ale');
      cy.get('[data-preview]').contains('Brewer\'s Summer Ale');

      cy.get('#input-description').type('Description for my summer beer');
      cy.get('[data-preview]').contains('Description for my summer beer');

      cy.get('#input-color').type('Rot');
      cy.get('[data-preview]').contains('Rot');

      cy.get('#input-ibu').type(37);
      cy.get('[data-preview]').contains(37);

      cy.get('#input-vol').type(5.3);
      cy.get('[data-preview]').contains(5.3);

      cy.get('#input-craft-beer-type').select('Stout');
      cy.get('[data-preview]').contains('Stout');

      cy.get('#input-hops').type('Citra');
      cy.get('[data-preview]').contains('Citra');

      cy.get('#input-craft-beer-image')
        .attachFile('brut-ale.png');

      cy.get('[data-preview]').find('img').should('have.attr', 'src').should('include', 'blob:');
    });
  });
});
