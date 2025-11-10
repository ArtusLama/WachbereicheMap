<template>
    <UiSidebarProvider>
        <div class="min-h-screen flex flex-col w-full">
            <NavigationBar />
            <main class="flex-1 px-16 py-16 mt-8">
                <slot />
            </main>
        </div>
    </UiSidebarProvider>
</template>
