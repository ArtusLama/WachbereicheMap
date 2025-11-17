<template>
    <UiButton
        variant="ghost"
        size="icon"
        title="Standorte als JSON exportieren"
        @click="handleExport"
    >
        <Icon
            name="lucide:download"
            class="h-4 w-4"
        />
    </UiButton>
</template>

<script setup lang="ts">
import { toast } from "vue-sonner"
import { useCoordinatesStore } from "~/stores/coordinates"

const coordinatesStore = useCoordinatesStore()

const handleExport = async () => {
    try {
        const jsonData = coordinatesStore.exportCoordinates()

        // Create blob and trigger download with save dialog
        const blob = new Blob([jsonData], { type: "application/json" })
        const url = URL.createObjectURL(blob)
        const link = document.createElement("a")
        link.href = url
        link.download = "flipper-map-locations-backup.json"
        document.body.appendChild(link)
        link.click()
        document.body.removeChild(link)
        URL.revokeObjectURL(url)

        toast.success("Export erfolgreich", {
            description: "Ihre Standorte wurden heruntergeladen.",
        })
    } catch (error) {
        toast.error("Export fehlgeschlagen", {
            description: "Beim Exportieren Ihrer Standorte ist ein Fehler aufgetreten.",
        })
    }
}
</script>
