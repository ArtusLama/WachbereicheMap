<template>
    <UiPopover v-model:open="isOpen">
        <UiPopoverTrigger as-child>
            <slot />
        </UiPopoverTrigger>
        <UiPopoverContent class="w-80">
            <div class="space-y-3">
                <h4 class="font-medium text-sm">
                    Standortnamen bearbeiten
                </h4>
                <UiInput
                    v-model="localName"
                    placeholder="Standortname eingeben"
                    @keydown.enter="handleSave"
                />
                <div class="flex gap-2 justify-end">
                    <UiButton
                        variant="outline"
                        size="sm"
                        @click="isOpen = false"
                    >
                        Abbrechen
                    </UiButton>
                    <UiButton
                        size="sm"
                        @click="handleSave"
                    >
                        Speichern
                    </UiButton>
                </div>
            </div>
        </UiPopoverContent>
    </UiPopover>
</template>

<script setup lang="ts">
import { ref, watch } from "vue"

const props = defineProps<{
    locationId: string
    currentName?: string
}>()

const emit = defineEmits<{
    save: [locationId: string, newName: string]
}>()

const isOpen = ref(false)
const localName = ref(props.currentName || "")

// Reset local name when popup opens
watch(isOpen, (newValue) => {
    if (newValue) {
        localName.value = props.currentName || ""
    }
})

const handleSave = () => {
    if (localName.value.trim()) {
        emit("save", props.locationId, localName.value.trim())
        isOpen.value = false
    }
}
</script>
