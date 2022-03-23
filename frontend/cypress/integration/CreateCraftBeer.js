describe('Create a CraftBeer', () => {
  beforeEach(() => {
    cy.loginViaAPI('Brewery');
    cy.validateToken('Brewery');

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

    cy.intercept(
      'GET',
      '/api/v1/breweries',
      {
        body: [
          {
            id: 1,
            created_at: '2022-03-08T15:31:21.938Z',
            updated_at: '2022-03-08T16:49:07.271Z',
            description: 'Finne ist eine neue Craft Beer Brauerei in Münsters Kreuzviertel. Wir brauen Klassiker, Kreativbiere \u0026 saisonale Spezialitäten aus besten Bio-Zutaten.',
            name: 'Finne Brauerei',
            ust_id: null,
            first_name: null,
            last_name: null,
            phone: null,
            logo: null,
            address: {
              street: 'Kirchfeldstr.', house_number: 1, postal_code: 40215, city: 'Düsseldorf', country: null,
            },
          },
        ],
      },
    );

    cy.intercept(
      'GET',
      '/api/v1/hops',
      {
        body: [
          'Citra',
          'Hallertauer Premium',
        ],
      },
    );

    cy.intercept(
      'GET',
      '/api/v1/flavors',
      {
        body: [
          'würzig',
          'süß',
        ],
      },
    );
  });

  it('displays the page', () => {
    cy.visit('/craft_beers/new');
    cy.contains('Erstelle ein neues Craft-Bier!');
    cy.contains('Craft-Bier speichern');
    cy.contains('Vorschau - Detailansicht');
  });

  context('with valid data', () => {
    it('updates the preview', () => {
      cy.intercept(
        'POST',
        '/api/v1/craft_beers',
        {
          statusCode: 200,
        },
      ).as('createCraftBeer');

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

      cy.get('#input-craft-beer-type').click().type('Stout{enter}');
      cy.get('[data-preview]').contains('Stout');

      cy.get('#input-hops').click().type('Citra{enter}');
      cy.get('[data-preview]').contains('Citra');

      cy.get('#input-craft-beer-image')
        .attachFile('brut-ale.png');

      cy.get('[data-preview]').find('img').should('have.attr', 'src').should('include', 'blob:');

      cy.contains('Craft-Bier speichern').click();
      cy.wait('@createCraftBeer');
      cy.location('pathname').should('eq', '/users/craft_beers');
    });
  });

  context('with invalid data', () => {
    it('updates the preview', () => {
      cy.intercept(
        'POST',
        '/api/v1/craft_beers',
        {
          statusCode: 406,
        },
      ).as('createCraftBeer');

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

      cy.get('#input-craft-beer-type').click().type('Stout{enter}');
      cy.get('[data-preview]').contains('Stout');

      cy.get('#input-hops').click().type('Citra{enter}');
      cy.get('[data-preview]').contains('Citra');

      cy.get('#input-craft-beer-image')
        .attachFile('brut-ale.png');

      cy.get('[data-preview]').find('img').should('have.attr', 'src').should('include', 'blob:');

      cy.contains('Craft-Bier speichern').click();
      cy.wait('@createCraftBeer');

      cy.location('pathname').should('eq', '/craft_beers/new');
    });
  });
});
