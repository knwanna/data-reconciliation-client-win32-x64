const { contextBridge } = require('electron');

contextBridge.exposeInMainWorld('electronAPI', {
    // Add API methods here if needed for secure communication
});
