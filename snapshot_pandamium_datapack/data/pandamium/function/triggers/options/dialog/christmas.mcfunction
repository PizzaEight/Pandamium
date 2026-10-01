#> Opens the Christmas category of the Options menu (only reachable during December).
# The seasonal options get their own category instead of being inputs of the Gameplay dialog because
# the Gameplay dialog's Done action can only carry 6 option digits (see read_dialog_inputs/main).
data modify storage pandamium:local functions."pandamium:triggers/options/*".dialog set value \
{\
    type: "minecraft:confirmation",\
    title: "Pandamium Christmas Options",\
    external_title: "Christmas...",\
    body: {type:"minecraft:plain_message",contents:"If On, christmas mobs will spawn around you during December.",width:400},\
    inputs:[\
        {\
            type: "minecraft:single_option",\
            key: "disable_christmas_mobs",\
            label: "Christmas Mobs",\
            options: [\
                {\
                    id: "0",\
                    display: {translate:"options.on"}\
                },\
                {\
                    id: "1",\
                    display: {translate:"options.off"}\
                }\
            ]\
        }\
    ],\
    yes: {\
        label: "Ignore Changes",\
        action: {\
            type: "run_command",\
            command: "/trigger options"\
        }\
    },\
    no: {\
        label: "Done",\
        action: {\
            type: "dynamic/run_command",\
            template: "trigger options set -10000000$(disable_christmas_mobs)5"\
        }\
    }\
}
execute if score @s optn.disable_christmas_mobs matches 1 run data modify storage pandamium:local functions."pandamium:triggers/options/*".dialog.inputs[{key:"disable_christmas_mobs"}].options[1].initial set value true
function pandamium:triggers/options/dialog/show with storage pandamium:local functions."pandamium:triggers/options/*"
