# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(moderator: true, email: 'tb_moderator@email.com', password: 's3cr3t')
User.create(moderator: false, email: 'tb_user@email.com', password: 'sup3Rs3cr3t')
BlogPost.create(title: 'Post 1',
                description: 'description for first post',
                content: 'An interesting content',
                user: User.find_by(email: 'tb_user@email.com'),
                status: :approved)
BlogPost.create(title: 'Post 2',
                description: 'description for second post',
                content: 'A compeling content',
                user: User.find_by(email: 'tb_user@email.com'),
                status: :submitted)
BlogPost.create(title: 'Post 3',
                description: 'description for third post',
                content: 'A thrilling content',
                user: User.find_by(email: 'tb_user@email.com'),
                status: :submitted)
BlogPost.create(title: 'Post 4',
                description: 'description for fourth post',
                content: 'Boring content',
                user: User.find_by(email: 'tb_user@email.com'),
                status: :declinded)
BlogPost.create(title: 'Post 5',
                description: 'description for fifth post',
                content: 'Super Boring content',
                user: User.find_by(email: 'tb_user@email.com'),
                status: :submitted)
BlogPost.create(title: 'Post 6',
                description: 'description for sixth post',
                content: 'Mega Boring content',
                user: User.find_by(email: 'tb_user@email.com'),
                status: :submitted)
BlogPost.create(title: 'Post 7',
                description: 'description for seventh post',
                content: 'Incredibly Boring content',
                user: User.find_by(email: 'tb_user@email.com'),
                status: :submitted)
