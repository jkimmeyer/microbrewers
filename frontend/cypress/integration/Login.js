describe('The Login Page', () => {
  beforeEach(() => {
    cy.visit('/users/login');
  });

  context('when not logged in', () => {
    it('successfully loads', () => {
      cy.get('#login-form').contains('E-Mail');
      cy.get('#login-form').contains('Passwort');
    });

    it('user gets an error with wrong credentials', () => {
      cy.intercept('POST', '/api/v1/auth/sign_in', {
        statusCode: 401,
        body: { success: false, errors: ['Invalid login credentials. Please try again.'] },
      }).as('invalidLogin');

      cy.get('#login-form').within(() => {
        cy.get('#input-email').type('test@example.com');
        cy.get('#input-password').type('wrong_password');
        cy.get('button').click();

        cy.wait('@invalidLogin');
        cy.get('.errors').contains('[ "Invalid login credentials. Please try again." ]');
      });
    });

    it('user gets redirected to login', () => {
      cy.visit('/dashboard');
      cy.location('pathname').should('eq', '/users/login');
    });

    it('user can login with valid credentials', () => {
      cy.intercept('POST', '/api/v1/auth/sign_in', {
        statusCode: 200,
        headers: {
          'access-token': '_UJyetNbYiYV6ZBmIoW88A',
          client: '5mRwPQPv6BpJesUG4WSfJg',
          uid: 'test@example.com',
        },
        body: {
          data: {
            email: 'test@example.com',
            provider: 'email',
            uid: 'test@example.com',
            id: 1,
            allow_password_change: false,
            account_type: 'Brewery',
            account_id: 4,
          },
        },
      }).as('validLogin');

      cy.get('#login-form').within(() => {
        cy.get('#input-email').type('test@example.com');
        cy.get('#input-password').type('right_password');
        cy.get('button').click();

        cy.log({ localStorage });

        cy.wait('@validLogin').then(() => {
          expect(localStorage.getItem('ACCESS_TOKEN')).to.eq('_UJyetNbYiYV6ZBmIoW88A');
          expect(localStorage.getItem('CLIENT')).to.eq('5mRwPQPv6BpJesUG4WSfJg');
          expect(localStorage.getItem('UID')).to.eq('test@example.com');
          cy.location('pathname').should('eq', '/dashboard');
        });
      });
    });
  });

  context('when logged in', () => {
    beforeEach(() => {
      cy.loginViaAPI();
    });

    it('user gets redirected to dashboard from login', () => {
      cy.validateToken();
      cy.visit('/users/login');

      cy.location('pathname').should('eq', '/dashboard');
    });

    it('user gets redirected to dashboard from registration', () => {
      cy.validateToken();

      cy.visit('/users/registration');
      cy.location('pathname').should('eq', '/dashboard');
    });

    it('user can logout', () => {
      cy.get('#navigation').within(() => {
        cy.contains('Cart');
        cy.contains('Logout');

        cy.get('button').click().then(() => {
          cy.contains('Login');
          cy.contains('Registrierung');
          expect(localStorage.getItem('ACCESS_TOKEN')).to.eq(null);
          expect(localStorage.getItem('CLIENT')).to.eq(null);
          expect(localStorage.getItem('UID')).to.eq(null);
          cy.location('pathname').should('eq', '/users/login');
        });
      });
    });
  });
});
