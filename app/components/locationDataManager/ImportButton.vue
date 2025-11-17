<template>
    <UiButton
        variant="ghost"
        size="icon"
        title="Standorte aus JSON importieren"
        @click="handleImportClick"
    >
        <Icon
            name="lucide:upload"
            class="h-4 w-4"
        />
    </UiButton>
    <input
        ref="fileInput"
        type="file"
        accept=".json"
        class="hidden"
        @change="handleFileSelect"
    >
    <LocationDataManagerImportModePopup
        ref="importModePopup"
        @mode-selected="handleModeSelected"
    />
</template>

<script setup lang="ts">
import { ref } from "vue"
import { toast } from "vue-sonner"
import { useCoordinatesStore } from "~/stores/coordinates"

const coordinatesStore = useCoordinatesStore()
const fileInput = ref<HTMLInputElement>()
const importModePopup = ref()
const selectedMode = ref<"replace" | "add" | null>(null)

const handleImportClick = () => {
    importModePopup.value.open()
}

const handleModeSelected = (mode: "replace" | "add") => {
    selectedMode.value = mode
    fileInput.value?.click()
}

const handleFileSelect = async (event: Event) => {
    const target = event.target as HTMLInputElement
    const file = target.files?.[0]

    if (!file || !selectedMode.value) {
        resetFileInput()
        return
    }

    try {
        const content = await file.text()
        performImport(content, selectedMode.value)
    } catch (error) {
        toast.error("Datei konnte nicht gelesen werden", {
            description: "Die ausgewählte Datei konnte nicht gelesen werden.",
        })
        resetFileInput()
    }
}

const performImport = (jsonData: string, mode: "replace" | "add") => {
    const result = coordinatesStore.importCoordinates(jsonData, mode)

    if (result.success) {
        toast.success("Import erfolgreich", {
            description: `${result.count} Standort(e) wurden importiert.`,
        })
    } else {
        toast.error("Import fehlgeschlagen", {
            description: result.error || "Beim Importieren der Standorte ist ein Fehler aufgetreten.",
        })
    }

    selectedMode.value = null
    resetFileInput()
}

const resetFileInput = () => {
    if (fileInput.value) {
        fileInput.value.value = ""
    }
}
</script>
