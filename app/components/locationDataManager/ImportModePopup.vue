<template>
    <Popover v-model:open="isOpen">
        <PopoverTrigger as-child>
            <div />
        </PopoverTrigger>
        <PopoverContent class="w-100">
            <div class="space-y-4">
                <div>
                    <h4 class="font-semibold leading-none">
                        Import-Modus
                    </h4>
                    <p class="text-sm text-muted-foreground mt-2">
                        Wählen Sie aus, wie Standorte aus der Datei importiert werden sollen.
                    </p>
                </div>

                <div class="flex flex-col gap-2 max-w-fit">
                    <UiButton
                        variant="default"
                        class="w-full justify-start"
                        @click="handleSelectMode('replace')"
                    >
                        <Icon name="lucide:replace" />
                        Alle ersetzen
                    </UiButton>
                    <UiButton
                        variant="outline"
                        class="w-full justify-start"
                        @click="handleSelectMode('add')"
                    >
                        <Icon name="lucide:circle-plus" />
                        Zu aktuellen hinzufügen
                    </UiButton>
                </div>
            </div>
        </PopoverContent>
    </Popover>
</template>

<script setup lang="ts">
import { ref } from "vue"
import { Popover, PopoverTrigger, PopoverContent } from "~/components/ui/popover"
import { Button as UiButton } from "~/components/ui/button"

const isOpen = ref(false)

const emit = defineEmits<{
    modeSelected: [mode: "replace" | "add"]
}>()

const handleSelectMode = (mode: "replace" | "add") => {
    emit("modeSelected", mode)
    isOpen.value = false
}

defineExpose({
    open: () => {
        isOpen.value = true
    },
    close: () => {
        isOpen.value = false
    },
})
</script>
