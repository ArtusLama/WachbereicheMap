import type { LocationType } from "~~/types"

export default function () {
    function getIconName(locationType?: LocationType): string {
        switch (locationType) {
            case "Pflegeheim":
                return "lucide:users"
            case "Krankenhaus":
                return "lucide:hospital"
            case "Rettungswache":
                return "lucide:ambulance"
            case "Arztpraxis":
                return "lucide:stethoscope"
            default:
                return "lucide:map-pin"
        }
    }

    return {
        getIconName,
    }
}
