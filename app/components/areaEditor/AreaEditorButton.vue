<template>
    <UiButton
        variant="outline"
        class="w-full"
        :class="{ 'bg-red-400/25! animate-pulse': isEditing }"
        @click="handleClick"
    >
        <div class="flex items-center gap-2">
            <div
                v-if="isEditing"
                class="size-3 rounded-full bg-red-500/50 animate-pulse"
            />
            <Icon
                v-if="!isEditing"
                name="lucide:pencil"
            />
            {{ isEditing ? "Hauptbereich abschließen" : "Hauptbereich bearbeiten" }}
        </div>
    </UiButton>
</template>

<script setup lang="ts">
import { useAreaEditorStore } from "~/stores/areaEditor"
import { toast } from "vue-sonner"
import { storeToRefs } from "pinia"

const areaEditor = useAreaEditorStore()
const { isEditing, points } = storeToRefs(areaEditor)

const handleClick = () => {
    const wasEditing = isEditing.value
    areaEditor.toggleEditing()

    if (wasEditing) {
        if (points.value.length < 3) {
            toast.error("Mindestens 3 Punkte erforderlich, um einen Bereich zu erstellen")
            return
        }
        toast.success("Bereich gespeichert!")
    } else {
        toast.info("Klicken Sie auf die Karte, um Punkte hinzuzufügen")
    }
}
</script>
