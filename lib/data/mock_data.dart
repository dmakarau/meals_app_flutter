import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meals.dart';

const extraCategories = [
  Category(
    id: 'c11',
    title: 'Mediterranean',
    color: Colors.indigo,
  ),
  Category(
    id: 'c12',
    title: 'Street Food',
    color: Colors.deepOrange,
  ),
  Category(
    id: 'c13',
    title: 'Desserts',
    color: Colors.pinkAccent,
  ),
  Category(
    id: 'c14',
    title: 'Vegan & Healthy',
    color: Colors.lightGreen,
  ),
  Category(
    id: 'c15',
    title: 'BBQ & Grilled',
    color: Colors.brown,
  ),
  Category(
    id: 'c16',
    title: 'Seafood',
    color: Colors.cyan,
  ),
  Category(
    id: 'c17',
    title: 'Soups & Stews',
    color: Colors.deepPurple,
  ),
  Category(
    id: 'c18',
    title: 'Latin American',
    color: Colors.orangeAccent,
  ),
  Category(
    id: 'c19',
    title: 'Festive Specials',
    color: Colors.redAccent,
  ),
  Category(
    id: 'c20',
    title: 'Snacks & Appetizers',
    color: Colors.blueGrey,
  ),
];

const mockedMeals = [
  Meal(
    id: 'm20',
    categories: ['c12'], // Street Food
    title: 'Falafel Wrap',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'https://images.unsplash.com/photo-1529006557810-274b9b2fc783?auto=format&fit=crop&w=800&q=80', // Falafel Wrap (Unsplash)
    duration: 15,
    ingredients: [
      '4 Falafel Balls',
      '1 Flatbread',
      'Lettuce',
      'Tomato',
      'Tahini Sauce',
    ],
    steps: [
      'Warm the flatbread.',
      'Add lettuce and tomato.',
      'Place falafel balls on top.',
      'Drizzle with tahini sauce and wrap.',
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm21',
    categories: ['c13'], // Desserts
    title: 'Chocolate Lava Cake',
    affordability: Affordability.luxurious,
    complexity: Complexity.challenging,
    imageUrl: 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?auto=format&fit=crop&w=800&q=80', // Chocolate Lava Cake (Unsplash)
    duration: 30,
    ingredients: [
      '100g Dark Chocolate',
      '50g Butter',
      '2 Eggs',
      '50g Sugar',
      '30g Flour',
    ],
    steps: [
      'Melt chocolate and butter.',
      'Whisk eggs and sugar.',
      'Combine with flour and chocolate mixture.',
      'Bake until edges are set but center is gooey.',
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm22',
    categories: ['c17'], // Soups & Stews
    title: 'Classic Minestrone Soup',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'https://images.unsplash.com/photo-1547592166-23ac45744acd?auto=format&fit=crop&w=800&q=80', // Minestrone Soup (Unsplash)
    duration: 40,
    ingredients: [
      'Carrots',
      'Celery',
      'Onion',
      'Tomatoes',
      'Beans',
      'Pasta',
      'Vegetable Broth',
    ],
    steps: [
      'Chop all vegetables.',
      'Sauté onion, carrots, and celery.',
      'Add tomatoes, broth, and beans.',
      'Simmer and add pasta until cooked.',
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm23',
    categories: ['c18'], // Latin American
    title: 'Tacos al Pastor',
    affordability: Affordability.affordable,
    complexity: Complexity.challenging,
    imageUrl: 'https://images.unsplash.com/photo-1551504734-5ee1c4a1479b?auto=format&fit=crop&w=800&q=80', // Tacos al Pastor (Unsplash)
    duration: 35,
    ingredients: [
      'Corn Tortillas',
      'Pork',
      'Pineapple',
      'Onion',
      'Cilantro',
      'Adobo Sauce',
    ],
    steps: [
      'Marinate pork in adobo sauce.',
      'Grill pork and slice thinly.',
      'Warm tortillas.',
      'Assemble tacos with pork, pineapple, onion, and cilantro.',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm1',
    categories: ['c1', 'c11'], // Italian, Mediterranean
    title: 'Spaghetti with Tomato Sauce',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
  imageUrl:
    'https://upload.wikimedia.org/wikipedia/commons/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg', // valid
    duration: 20,
    ingredients: [
      '4 Tomatoes',
      '1 Tablespoon Olive Oil',
      '1 Onion',
      '250g Spaghetti',
      'Spices',
      'Cheese (optional)',
    ],
    steps: [
      'Cut tomatoes and onion.',
      'Boil water, add salt.',
      'Cook spaghetti 10-12 minutes.',
      'Fry onion in olive oil.',
      'Add tomatoes and spices.',
      'Serve sauce with spaghetti.',
      'Optionally add cheese.',
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm2',
    categories: ['c2', 'c4', 'c20'], // Quick & Easy, German, Snacks
    title: 'Toast Hawaii',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl:
      'https://images.unsplash.com/photo-1571091718767-18b5b1457add?auto=format&fit=crop&w=800&q=80', // Toast Hawaii (Unsplash)
    duration: 10,
    ingredients: [
      '1 Slice of White Bread',
      '1 Slice of Ham',
      '1 Slice of Pineapple',
      '1 Slice of Cheese',
      'Butter',
    ],
    steps: [
      'Butter bread lightly.',
      'Top with ham, pineapple, and cheese.',
      'Bake in oven until cheese melts.',
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm4',
    categories: ['c4', 'c19'], // German, Festive Specials
    title: 'Wiener Schnitzel',
    affordability: Affordability.luxurious,
    complexity: Complexity.challenging,
    imageUrl:
      'https://images.unsplash.com/photo-1599921841143-819065a55cc6?auto=format&fit=crop&w=800&q=80', // Wiener Schnitzel (Unsplash)
    duration: 60,
    ingredients: [
      '4 Veal Cutlets',
      'Flour',
      'Eggs',
      'Breadcrumbs',
      'Butter',
      'Lemon Slices',
    ],
    steps: [
      'Pound cutlets thin.',
      'Coat with flour, egg, and breadcrumbs.',
      'Fry in butter until golden.',
      'Serve with lemon slices.',
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm5',
    categories: ['c5', 'c16', 'c14'], // Light & Lovely, Seafood, Healthy
    title: 'Salad with Smoked Salmon',
    affordability: Affordability.luxurious,
    complexity: Complexity.simple,
     imageUrl:
         'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?auto=format&fit=crop&w=800&q=80', // Smoked Salmon Salad (Unsplash)
    duration: 15,
    ingredients: [
      'Lettuce',
      'Arugula',
      '200g Smoked Salmon',
      'Olive Oil',
      'Lemon Juice',
    ],
    steps: [
      'Wash and cut salad leaves.',
      'Arrange salmon slices on top.',
      'Drizzle olive oil and lemon juice.',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm10',
    categories: ['c10', 'c14', 'c5'], // Summer, Healthy, Light & Lovely
    title: 'Asparagus Salad with Cherry Tomatoes',
    affordability: Affordability.pricey,
    complexity: Complexity.simple,
    imageUrl:
      'https://images.unsplash.com/photo-1540420773420-3366772f4999?auto=format&fit=crop&w=800&q=80', // Asparagus Salad (Unsplash)
    duration: 30,
    ingredients: [
      'Green Asparagus',
      'Cherry Tomatoes',
      'Olive Oil',
      'Balsamic Vinegar',
    ],
    steps: [
      'Cook asparagus briefly in water.',
      'Cut tomatoes in halves.',
      'Mix with olive oil and balsamic.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm11',
    categories: ['c16', 'c15', 'c11'], // Seafood, BBQ & Grilled, Mediterranean
    title: 'Grilled Salmon',
    affordability: Affordability.luxurious,
    complexity: Complexity.simple,
    imageUrl:
      'https://images.unsplash.com/photo-1467003909585-2f8a72700288?auto=format&fit=crop&w=800&q=80', // Grilled Salmon (Unsplash)
    duration: 25,
    ingredients: [
      '2 Salmon Fillets',
      'Olive Oil',
      'Salt',
      'Pepper',
      'Lemon Juice',
    ],
    steps: [
      'Rub salmon with oil, salt, and pepper.',
      'Grill for 10 minutes.',
      'Serve with lemon juice.',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm14',
    categories: ['c5', 'c11', 'c10'], // Light & Lovely, Mediterranean, Summer
    title: 'Caesar Salad',
    affordability: Affordability.pricey,
    complexity: Complexity.simple,
     imageUrl:
         'https://images.unsplash.com/photo-1546793665-c74683f339c1?auto=format&fit=crop&w=800&q=80', // Caesar Salad (Unsplash)
    duration: 20,
    ingredients: [
      'Romaine Lettuce',
      'Croutons',
      'Parmesan',
      'Caesar Dressing',
    ],
    steps: [
      'Wash and chop lettuce.',
      'Add croutons and parmesan.',
      'Drizzle with dressing.',
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
];
