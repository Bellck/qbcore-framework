exports('GetTunerGarageObject', function()
    return TunerGarage
end)

TunerGarage = {
    InteriorId = 285953,

    Ipl = {
        Interior = {
            ipl = {
                'tr_tuner_shop_burton',
                'tr_tuner_shop_mesa',
                'tr_tuner_shop_mission',
                'tr_tuner_shop_rancho',
                'tr_tuner_shop_strawberry'
            }
        },

        Load = function()
            EnableIpl(TunerGarage.Ipl.Interior.ipl, false)
        end,
        Remove = function()
            EnableIpl(TunerGarage.Ipl.Interior.ipl, false)
        end,
    },
    Entities = {
        entity_set_bedroom = false,
        entity_set_bedroom_empty = false,
        entity_set_bombs = false,
        entity_set_box_clutter = false,
        entity_set_cabinets = false,
        entity_set_car_lift_cutscene = false,
        entity_set_car_lift_default = false,
        entity_set_car_lift_purchase = false,
        entity_set_chalkboard = false,
        entity_set_container = false,
        entity_set_cut_seats = false,
        entity_set_def_table = false,
        entity_set_drive = false,
        entity_set_ecu = false,
        entity_set_IAA = false,
        entity_set_jammers = false,
        entity_set_laptop = false,
        entity_set_lightbox = false,
        entity_set_methLab = false,
        entity_set_plate = false,
        entity_set_scope = false,
        entity_set_style_1 = false,
        entity_set_style_2 = false,
        entity_set_style_3 = false,
        entity_set_style_4 = false,
        entity_set_style_5 = false,
        entity_set_style_6 = false,
        entity_set_style_7 = false,
        entity_set_style_8 = false,
        entity_set_style_9 = false,
        entity_set_table = false,
        entity_set_thermal = false,
        entity_set_tints = false,
        entity_set_train = false,
        entity_set_virus = false,

        Set = function(name, state)
            for entity, _ in pairs(TunerGarage.Entities) do
                if entity == name then
                    TunerGarage.Entities[entity] = state
                    TunerGarage.Entities.Clear()
                    TunerGarage.Entities.Load()
                end
            end
        end,
        Load = function()
            for entity, state in pairs(TunerGarage.Entities) do
                if type(entity) == 'string' and state then
                    ActivateInteriorEntitySet(TunerGarage.InteriorId, entity)
                end
            end
        end,
        Clear = function()
            for entity, _ in pairs(TunerGarage.Entities) do
                if type(entity) == 'string' then
                    DeactivateInteriorEntitySet(TunerGarage.InteriorId, entity)
                end
            end
        end
    },

    LoadDefault = function()
        TunerGarage.Ipl.Load()
        TunerGarage.Entities.Load()

        RefreshInterior(TunerGarage.interiorId)
    end
}
