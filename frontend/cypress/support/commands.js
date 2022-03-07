// ***********************************************
// This example commands.js shows you how to
// create various custom commands and overwrite
// existing commands.
//
// For more comprehensive examples of custom
// commands please read more here:
// https://on.cypress.io/custom-commands
// ***********************************************
//
//
// -- This is a parent command --
// Cypress.Commands.add('login', (email, password) => { ... })
//
//
// -- This is a child command --
// Cypress.Commands.add('drag', { prevSubject: 'element'}, (subject, options) => { ... })
//
//
// -- This is a dual command --
// Cypress.Commands.add('dismiss', { prevSubject: 'optional'}, (subject, options) => { ... })
//
//
// -- This will overwrite an existing command --
// Cypress.Commands.overwrite('visit', (originalFn, url, options) => { ... })
import 'cypress-file-upload';

const getLoginResponse = (email, id, accountType, accountId) => ({
  headers: {
    'access-token': 'access-token',
    uid: 'uid',
    client: 'client',
  },
  body: {
    success: true,
    data: {
      email,
      provider: 'email',
      uid: email,
      id,
      allow_password_change: false,
      account_type: accountType,
      account_id: accountId,
    },
  },
});

Cypress.Commands.add('loginViaAPI', (
  accountType = 'Customer',
  accountId = 1,
  id = 1,
  email = 'test@example.com',
) => {
  cy.intercept(
    'POST',
    '/api/v1/auth/sign_in',
    getLoginResponse(email, id, accountType, accountId),
  );

  cy.visit('/users/login');
  cy.get('#login-form').within(() => {
    cy.get('#input-email').type('test@example.com');
    cy.get('#input-password').type('valid_password');
    cy.get('button').click();
  });
});

Cypress.Commands.add('validateToken', (
  accountType = 'Customer',
  accountId = 1,
  id = 1,
  email = 'test@example.com',
) => {
  cy.intercept(
    'GET',
    '/api/v1/auth/validate_token',
    getLoginResponse(email, id, accountType, accountId),
  );
});
