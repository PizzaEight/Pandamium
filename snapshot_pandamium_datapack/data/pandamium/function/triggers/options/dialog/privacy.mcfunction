data modify storage pandamium:local functions."pandamium:triggers/options/*".dialog set value \
{\
    type: "minecraft:confirmation",\
    title: "Pandamium Privacy Settings",\
    external_title: "Privacy...",\
    inputs: [\
        {\
            type: "minecraft:single_option",\
            key: "disable_tpa_requests",\
            label: "Receive TPA Requests",\
            options: [\
                {\
                    id: "0",\
                    display: "All"\
                },\
                {\
                    id: "1",\
                    display: "None"\
                },\
                {\
                    id: "2",\
                    display: "All Except Guests"\
                }\
            ]\
        },\
        {\
            type: "minecraft:single_option",\
            key: "disable_receiving_mail",\
            label: "Receive Mail",\
            options: [\
                {\
                    id: "0",\
                    display: "All"\
                },\
                {\
                    id: "1",\
                    display: "None"\
                },\
                {\
                    id: "2",\
                    display: "All Except Guests"\
                }\
            ]\
        },\
        {\
            type: "minecraft:single_option",\
            key: "hide_coordinates",\
            label: "Hide Coordinates",\
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
        },\
        {\
            type: "minecraft:single_option",\
            key: "hide_trophy_suffix",\
            label: "Show Leader Board Trophy",\
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
            key: "hide_voting_announcements",\
            label: "Announce Votes",\
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
            key: "disable_donator_prefix",\
            label: {color:"gray",text:"Supporter Prefix"},\
            label_visible: false,\
            options: [\
                {\
                    id: "1",\
                    display: [{color:"gray",text:"Supporter Prefix: "},{translate:"options.off"}," 🔒"]\
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
            template: "trigger options set -100$(disable_donator_prefix)$(hide_voting_announcements)$(hide_trophy_suffix)$(hide_coordinates)$(disable_receiving_mail)$(disable_tpa_requests)3"\
        }\
    }\
}
execute if score @s disable_tpa_requests matches 1 run data modify storage pandamium:local functions."pandamium:triggers/options/*".dialog.inputs[{key:"disable_tpa_requests"}].options[1].initial set value 1b
execute if score @s disable_tpa_requests matches 2 run data modify storage pandamium:local functions."pandamium:triggers/options/*".dialog.inputs[{key:"disable_tpa_requests"}].options[2].initial set value 1b
execute if score @s optn.disable_receiving_mail matches 1 run data modify storage pandamium:local functions."pandamium:triggers/options/*".dialog.inputs[{key:"disable_receiving_mail"}].options[1].initial set value 1b
execute if score @s optn.disable_receiving_mail matches 2 run data modify storage pandamium:local functions."pandamium:triggers/options/*".dialog.inputs[{key:"disable_receiving_mail"}].options[2].initial set value 1b
execute if score @s hide_coordinates matches 1 run data modify storage pandamium:local functions."pandamium:triggers/options/*".dialog.inputs[{key:"hide_coordinates"}].options[1].initial set value 1b
execute if score @s hide_trophy_suffix matches 1 run data modify storage pandamium:local functions."pandamium:triggers/options/*".dialog.inputs[{key:"hide_trophy_suffix"}].options[1].initial set value 1b
execute if score @s hide_voting_announcements matches 1 run data modify storage pandamium:local functions."pandamium:triggers/options/*".dialog.inputs[{key:"hide_voting_announcements"}].options[1].initial set value 1b
execute if predicate pandamium:player/can_display_supporter_rank run data modify storage pandamium:local functions."pandamium:triggers/options/*".dialog.inputs[{key:"disable_donator_prefix"}] merge value {type:"minecraft:single_option",key:"disable_donator_prefix",label:{color:"dark_purple",text:"Supporter Prefix"},label_visible:true,options:[{id:"0",display:{translate:"options.on"}},{id:"1",display:{translate:"options.off"}}]}
execute if predicate pandamium:player/can_display_supporter_rank if score @s disable_donator_prefix matches 1 run data modify storage pandamium:local functions."pandamium:triggers/options/*".dialog.inputs[{key:"disable_donator_prefix"}].options[1].initial set value true
function pandamium:triggers/options/dialog/show with storage pandamium:local functions."pandamium:triggers/options/*"
