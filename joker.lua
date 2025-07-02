----------------------------------------------
------------MOD CODE -------------------------

SMODS.Atlas {
	key = "jokers",
	path = "atlas_jokers.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "placeholders",
	path = "atlas_placeholders.png",
	px = 71,
	py = 95
}

SMODS.Joker {
    key = "the_fucking_sun",
    config = { extra = { plus_asc = 72 } },
    rarity = "cry_epic",
    cost = 16,
    blueprint_compat = true,
    eternal_compat = true,
    pos = { x = 0, y = 0 },
    atlas = "jokers",
    demicoloncompat = true,
    pools = { ["Meme"] = true },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                number_format(card.ability.extra.plus_asc),
            },
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main or context.forcetrigger then
            return {
                plus_asc = card.ability.extra.plus_asc
            }
        end
    end,
}

SMODS.Joker {
    key = "bright_joker",
    config = { extra = { plus_asc = 4, type = "Pair" } },
    rarity = 2,
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    pos = { x = 1, y = 0 },
    atlas = "jokers",
    demicoloncompat = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                number_format(card.ability.extra.plus_asc),
				card.ability.extra_type,
            },
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) or context.forcetrigger then
            return {
                plus_asc = card.ability.extra.plus_asc
            }
        end
    end,
}

SMODS.Joker {
    key = "accelerated_backwards_hopping",
    config = { extra = { arrows = 1 } },
    rarity = "cry_epic",
    cost = 13,
    blueprint_compat = true,
    eternal_compat = true,
    pos = { x = 0, y = 3 },
    atlas = "placeholders",
    demicoloncompat = true,
    pools = { ["Meme"] = true },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                number_format(card.ability.extra.arrows),
            },
        }
    end,
    calculate = function(self, card, context)
		if context.joker_main or context.forcetrigger then
    		for i, v in pairs(G.jokers.cards) do if v.config.center.key == "j_entr_dekatria" then v.ability.immutable.arrows = v.ability.immutable.arrows + card.ability.extra.arrows end end
    		return {
                message = localize("k_upgrade_ex"),
                colour = G.C.ATTENTION,
            nil, true }
		end
    end,
}

SMODS.Joker {
    key = "sunrise",
    config = { extra = { plus_asc = 0, asc_mod = 1 } },
    rarity = 3,
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    pos = { x = 2, y = 0 },
    atlas = "jokers",
    demicoloncompat = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.plus_asc,
                card.ability.extra.asc_mod,
            },
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers then
            card.ability.extra.plus_asc = card.ability.extra.plus_asc + card.ability.extra.asc_mod
            return {
                message = localize("k_upgrade_ex"),
                colour = G.C.GOLD,
            }
        end
        if context.joker_main or context.forcetrigger then
            return {
                plus_asc = card.ability.extra.plus_asc
            }
        end
    end,
}

SMODS.Joker {
    key = "celestial_joker",
    config = {},
    rarity = 3,
    cost = 10,
    blueprint_compat = true,
    eternal_compat = true,
    pos = { x = 3, y = 0 },
    atlas = "jokers",
    demicoloncompat = true,
    loc_vars = function(self, info_queue, card)
    end,
    calculate = function(self, card, context)
        if context.joker_main or context.forcetrigger then
            return {
                Xmult = G.GAME.hands[context.scoring_name].level
            }
        end
    end,
}

----------------------------------------------
------------MOD CODE END----------------------
