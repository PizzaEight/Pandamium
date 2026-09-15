data modify storage pandamium:local functions."pandamium:triggers/options/*".dialog set value \
{\
    type: "minecraft:confirmation",\
    title: "Pandamium Accessibility Settings",\
    external_title: "Accessibility...",\
    inputs: [\
        {\
            type: "minecraft:single_option",\
            key: "pronouns_type",\
            label: "Preferred Pronouns",\
            options: [\
                {\
                    id: "0",\
                    display: "Unspecified"\
                },\
                {\
                    id: "1",\
                    display: "He/Him"\
                },\
                {\
                    id: "2",\
                    display: "She/Her"\
                },\
                {\
                    id: "3",\
                    display: "They/Them"\
                }\
            ]\
        },\
        {\
            type: "minecraft:single_option",\
            key: "secondary_pronouns_type",\
            label: "Secondary Pronouns",\
            options: [\
                {\
                    id: "0",\
                    display: "None"\
                },\
                {\
                    id: "1",\
                    display: "He/Him"\
                },\
                {\
                    id: "2",\
                    display: "She/Her"\
                },\
                {\
                    id: "3",\
                    display: "They/Them"\
                }\
            ]\
        },\
        {\
            type: "minecraft:single_option",\
            key: "disable_dynamic_tpa_triggers",\
            label: "Dynamic TPA Triggers",\
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
        },\
        {\
            type: "minecraft:single_option",\
            key: "disable_dynamic_home_triggers",\
            label: "Dynamic Home Triggers",\
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
        },\
        {\
            type: "minecraft:single_option",\
            key: "enable_dynamic_mail_triggers",\
            label: "Dynamic Mail Triggers",\
            options: [\
                {\
                    id: "0",\
                    display: {translate:"options.off"}\
                },\
                {\
                    id: "1",\
                    display: {translate:"options.on"}\
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
            template: "trigger options set -1000$(enable_dynamic_mail_triggers)$(disable_dynamic_home_triggers)$(disable_dynamic_tpa_triggers)$(secondary_pronouns_type)$(pronouns_type)2"\
        }\
    }\
}
execute if score @s optn.disable_dynamic_triggers.tpa_names matches 1 run data modify storage pandamium:local functions."pandamium:triggers/options/*".dialog.inputs[{key:"disable_dynamic_tpa_triggers"}].options[1].initial set value 1b
execute if score @s optn.disable_dynamic_triggers.home_names matches 1 run data modify storage pandamium:local functions."pandamium:triggers/options/*".dialog.inputs[{key:"disable_dynamic_home_triggers"}].options[1].initial set value 1b
execute if score @s optn.enable_dynamic_triggers.mail_names matches 1 run data modify storage pandamium:local functions."pandamium:triggers/options/*".dialog.inputs[{key:"enable_dynamic_mail_triggers"}].options[1].initial set value 1b
execute if score @s pronouns_type matches 1 run data modify storage pandamium:local functions."pandamium:triggers/options/*".dialog.inputs[{key:"pronouns_type"}].options[1].initial set value 1b
execute if score @s pronouns_type matches 2 run data modify storage pandamium:local functions."pandamium:triggers/options/*".dialog.inputs[{key:"pronouns_type"}].options[2].initial set value 1b
execute if score @s pronouns_type matches 3 run data modify storage pandamium:local functions."pandamium:triggers/options/*".dialog.inputs[{key:"pronouns_type"}].options[3].initial set value 1b
execute if score @s secondary_pronouns_type matches 1 run data modify storage pandamium:local functions."pandamium:triggers/options/*".dialog.inputs[{key:"secondary_pronouns_type"}].options[1].initial set value 1b
execute if score @s secondary_pronouns_type matches 2 run data modify storage pandamium:local functions."pandamium:triggers/options/*".dialog.inputs[{key:"secondary_pronouns_type"}].options[2].initial set value 1b
execute if score @s secondary_pronouns_type matches 3 run data modify storage pandamium:local functions."pandamium:triggers/options/*".dialog.inputs[{key:"secondary_pronouns_type"}].options[3].initial set value 1b
function pandamium:triggers/options/dialog/show with storage pandamium:local functions."pandamium:triggers/options/*"
