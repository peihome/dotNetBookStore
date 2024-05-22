INSERT INTO Genres (id, name) VALUES (101234, 'Science Fiction');
INSERT INTO Genres (id, name) VALUES (202345, 'Fantasy');
INSERT INTO Genres (id, name) VALUES (303456, 'Mystery');
INSERT INTO Genres (id, name) VALUES (404567, 'Thriller');
INSERT INTO Genres (id, name) VALUES (505678, 'Historical Fiction');
INSERT INTO Genres (id, name) VALUES (606789, 'Horror');
INSERT INTO Genres (id, name) VALUES (707890, 'Non-Fiction');


-- Science Fiction
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (100001, 'Dune', 9.99, 'A science fiction novel by Frank Herbert.', 101234);
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (100002, 'Neuromancer', 8.99, 'A science fiction novel by William Gibson.', 101234);
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (100003, 'Foundation', 7.99, 'A science fiction novel by Isaac Asimov.', 101234);
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (100004, 'Ender''s Game', 6.99, 'A science fiction novel by Orson Scott Card.', 101234);
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (100005, 'Snow Crash', 8.49, 'A science fiction novel by Neal Stephenson.', 101234);

-- Fantasy
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (200001, 'The Hobbit', 10.99, 'A fantasy novel by J.R.R. Tolkien.', 202345);
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (200002, 'Harry Potter and the Sorcerer''s Stone', 9.49, 'A fantasy novel by J.K. Rowling.', 202345);
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (200003, 'The Name of the Wind', 8.99, 'A fantasy novel by Patrick Rothfuss.', 202345);
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (200004, 'The Way of Kings', 7.99, 'A fantasy novel by Brandon Sanderson.', 202345);
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (200005, 'A Game of Thrones', 9.99, 'A fantasy novel by George R.R. Martin.', 202345);

-- Mystery
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (300001, 'The Girl with the Dragon Tattoo', 8.99, 'A mystery novel by Stieg Larsson.', 303456);
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (300002, 'Gone Girl', 7.99, 'A mystery novel by Gillian Flynn.', 303456);
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (300003, 'Big Little Lies', 9.49, 'A mystery novel by Liane Moriarty.', 303456);
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (300004, 'The Da Vinci Code', 8.99, 'A mystery novel by Dan Brown.', 303456);
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (300005, 'In the Woods', 7.99, 'A mystery novel by Tana French.', 303456);

-- Thriller
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (400001, 'The Silence of the Lambs', 9.99, 'A thriller novel by Thomas Harris.', 404567);
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (400002, 'The Girl on the Train', 8.99, 'A thriller novel by Paula Hawkins.', 404567);
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (400003, 'Gone Girl', 7.99, 'A thriller novel by Gillian Flynn.', 404567);
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (400004, 'The Bourne Identity', 8.49, 'A thriller novel by Robert Ludlum.', 404567);
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (400005, 'Shutter Island', 9.49, 'A thriller novel by Dennis Lehane.', 404567);

-- Historical Fiction
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (500001, 'The Book Thief', 10.99, 'A historical fiction novel by Markus Zusak.', 505678);
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (500002, 'All the Light We Cannot See', 9.99, 'A historical fiction novel by Anthony Doerr.', 505678);
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (500003, 'The Nightingale', 8.99, 'A historical fiction novel by Kristin Hannah.', 505678);
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (500004, 'The Help', 7.99, 'A historical fiction novel by Kathryn Stockett.', 505678);
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (500005, 'The Pillars of the Earth', 9.49, 'A historical fiction novel by Ken Follett.', 505678);

-- Horror
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (600001, 'The Shining', 9.99, 'A horror novel by Stephen King.', 606789);
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (600002, 'It', 8.99, 'A horror novel by Stephen King.', 606789);
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (600003, 'Dracula', 7.99, 'A horror novel by Bram Stoker.', 606789);
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (600004, 'The Haunting of Hill House', 8.49, 'A horror novel by Shirley Jackson.', 606789);
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (600005, 'Frankenstein', 9.49, 'A horror novel by Mary Shelley.', 606789);

-- Non-Fiction
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (700001, 'Sapiens', 10.99, 'A non-fiction book by Yuval Noah Harari.', 707890);
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (700002, 'Educated', 9.99, 'A non-fiction book by Tara Westover.', 707890);
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (700003, 'Becoming', 8.99, 'A non-fiction book by Michelle Obama.', 707890);
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (700004, 'The Immortal Life of Henrietta Lacks', 7.99, 'A non-fiction book by Rebecca Skloot.', 707890);
INSERT INTO Books (Id, Name, Price, Description, Genre_id) VALUES (700005, 'Unbroken', 9.49, 'A non-fiction book by Laura Hillenbrand.', 707890);