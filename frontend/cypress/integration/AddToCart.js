import * as _ from 'lodash';

describe('Craft Beer Index', () => {
  beforeEach(() => {
    cy.fixture('craftBeers.json').then((json) => {
      cy.intercept(
        'GET',
        '/api/v1/craft_beers',
        {
          body: json,
        },
      );
    });

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
            created_at: "2022-03-08T15:31:21.938Z",
            updated_at: "2022-03-08T16:49:07.271Z",
            description: "Finne ist eine neue Craft Beer Brauerei in Münsters Kreuzviertel. Wir brauen Klassiker, Kreativbiere \u0026 saisonale Spezialitäten aus besten Bio-Zutaten.",
            name: "Finne Brauerei",
            ust_id: null,
            first_name: null,
            last_name: null,
            phone: null,
            logo: null,
            address: { street: "Kirchfeldstr.", house_number: 1, postal_code: 40215, city: "Düsseldorf", country: null }
          }
        ]
      }
    )

    cy.intercept('https://api.mapbox.com/**/*');
    cy.intercept('https://events.mapbox.com/**/*');
  });

  it('can add items to cart by input', () => {
    cy.visit('/craft_beers');

    cy.contains('Birra Moretti').parents('[data-craft-beer]').within(() => {
      cy.get('.cart-input').type(3);
      cy.get('[aria-label="In den Einkaufswagen legen"]').click();
    });

    cy.visit('/cart');
    cy.contains('Birra Moretti');
    cy.contains(3);
  });

  it('can add items and remove items from cart by buttons and remove them afterwards', () => {
    cy.visit('/craft_beers');

    cy.contains('Birra Moretti').parents('[data-craft-beer]').within(() => {
      cy.get('.cart-input').type(3);
      _.times(3, () => cy.get('[aria-label="Anzahl verringern"]').click());
      cy.get('[aria-label="Anzahl erhöhen"]').click();
      cy.get('[aria-label="In den Einkaufswagen legen"]').click();
    });

    cy.visit('/cart');
    cy.contains('Birra Moretti');
    cy.contains(1);

    cy.get('[aria-label="Aus dem Einkaufswagen entfernen"]').click();
    cy.contains('Birra Moretti').should('not.exist');
  });
});
