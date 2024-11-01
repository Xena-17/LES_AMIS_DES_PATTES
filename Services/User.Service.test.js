const { addUser, users, getUser, updateUser, deleteUser } = require('./UserService');

beforeEach(() => {
    users.length = 0; // Vide la liste avant chaque test
});

describe('Tests du module userService', () => {
    test('addUser ajoute correctement un utilisateur', () => {
        addUser("Alice", "alice@example.com", "password123", "123 Rue Principale");
        expect(users.length).toBe(1); // Vérifie que la longueur est bien 1
    });
});

    test('getUser retourne le bon utilisateur', () => {
        addUser("Alice", "alice@example.com", "password123", "123 Rue Principale");
        const user = getUser(1);
        expect(user.name).toBe("Alice");
    });

    test('updateUser modifie les informations d\'un utilisateur existant', () => {
        addUser("Alice", "alice@example.com", "password123", "123 Rue Principale");
        const updatedUser = updateUser(1, "Alice Updated", "alice_updated@example.com", "newpassword", "456 Rue Secondaire");
        expect(updatedUser.name).toBe("Alice Updated");
        expect(updatedUser.email).toBe("alice_updated@example.com");
    });

    test('deleteUser supprime bien l\'utilisateur', () => {
        const user = addUser("Alice", "alice@example.com", "password123", "123 Rue Principale");
        const deletedUser = deleteUser(user.id);
        expect(deletedUser.name).toBe("Alice");
        expect(users.length).toBe(0); // Vérifie que la liste est vide après suppression
    });

