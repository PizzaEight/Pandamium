#> Opens the Halloween category of the Options menu (only reachable during October).
# The seasonal options get their own category instead of being inputs of the Gameplay dialog because
# the Gameplay dialog's Done action can only carry 6 option digits (see read_dialog_inputs/main).
data modify storage pandamium:local functions."pandamium:triggers/options/*".dialog set value \
{\
    type: "minecraft:confirmation",\
    title: "Pandamium Halloween Options",\
    external_title: "Halloween...",\
    body: {type:"minecraft:plain_message",contents:"If On, flying eyeballs will spawn around you during October",width:400},\
    inputs:[\
        {\
            type: "minecraft:single_option",\
            key: "disable_flying_eyeballs",\
            label: "Flying Eyeballs",\
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
            template: "trigger options set -10000000$(disable_flying_eyeballs)4"\
        }\
    }\
}
execute if score @s optn.disable_flying_eyeballs matches 1 run data modify storage pandamium:local functions."pandamium:triggers/options/*".dialog.inputs[{key:"disable_flying_eyeballs"}].options[1].initial set value true
function pandamium:triggers/options/dialog/show with storage pandamium:local functions."pandamium:triggers/options/*"
