const mongoose = require('mongoose');

const gameSchema = new mongoose.Schema({
    words: [
        {
            type: String
        }
    ],
    players: [],
    isJoin: {
        type: Boolean,
        default: true
    },
    isOver: {
        type: Boolean,
        default: false
    },
    startTime: {
        type: Number
    }
});

const Game = mongoose.model('Game', gameSchema);

module.exports = Game;