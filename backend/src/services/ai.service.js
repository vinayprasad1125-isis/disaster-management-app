const { OpenAI } = require('openai');

class AIService {
  _getClient() {
    if (this._openai) return this._openai;
    const key = process.env.OPENAI_API_KEY;
    if (!key || key.includes('key_GwRZGAAJ3aZ90dVb')) return null; // Ignore invalid default key
    
    try {
      this._openai = new OpenAI({ apiKey: key });
      return this._openai;
    } catch (e) {
      console.error('Failed to initialize OpenAI client:', e.message);
      return null;
    }
  }

  async processEmergencyChat(message, history = []) {
    const openai = this._getClient();

    if (!openai) {
      return this._mockResponse(message);
    }

    try {
      const systemInstruction = `You are an AI emergency assistant for a disaster management app called "Disaster Management". 
Your role is to help users during emergencies — provide calm, clear, and actionable guidance. 
You can help with: evacuation routes, first aid advice, emergency contacts, shelter locations, 
disaster preparedness tips, flood/earthquake/fire safety, and general crisis support. 
Keep responses concise (2-4 sentences), practical, and reassuring. 
Always prioritize life safety. If someone is in immediate danger, tell them to call emergency services (112 in India).`;

      // Map our history to OpenAI format
      const messages = [
        { role: 'system', content: systemInstruction },
        ...history.map(h => ({
          role: h.role === 'assistant' ? 'assistant' : 'user',
          content: h.content || h.text || ''
        })),
        { role: 'user', content: message }
      ].filter(m => m.content);

      const completion = await openai.chat.completions.create({
        messages,
        model: 'gpt-4o-mini', // or 'gpt-3.5-turbo' if you prefer
        temperature: 0.7,
        max_tokens: 400,
      });

      const reply = completion.choices[0].message.content;
      return { reply };
    } catch (error) {
      console.error('OpenAI API Error:', error.message);
      return this._mockResponse(message);
    }
  }

  _mockResponse(message) {
    const lowerMsg = message.toLowerCase();
    let reply;

    if (lowerMsg.includes('flood')) {
      reply = "Move to higher ground immediately and avoid walking through floodwaters. Call emergency services at 112 and stay tuned to local alerts. Do not drive through flooded roads.";
    } else if (lowerMsg.includes('earthquake')) {
      reply = "Drop, cover, and hold on under a sturdy desk or against an interior wall. Stay away from windows. After shaking stops, evacuate if safe and check for injuries.";
    } else if (lowerMsg.includes('fire')) {
      reply = "Alert everyone, activate the fire alarm, and evacuate immediately via the nearest exit — don't use elevators. Call 101 (fire) or 112. If trapped, seal doors and signal from windows.";
    } else if (lowerMsg.includes('shelter') || lowerMsg.includes('safe')) {
      reply = "Check the Map tab in this app for nearby shelters and relief centers. Stay away from disaster-affected areas and follow instructions from local authorities.";
    } else if (lowerMsg.includes('first aid') || lowerMsg.includes('injured')) {
      reply = "For serious injuries, call 108 (ambulance) immediately. Apply pressure to stop bleeding, keep the person still, and keep them warm. Do not move someone with a possible spinal injury.";
    } else if (lowerMsg.includes('hello') || lowerMsg.includes('hi') || lowerMsg.includes('hey')) {
      reply = "Hello! I'm your AI Emergency Assistant. I'm here to help you stay safe during disasters. Ask me about evacuation, first aid, shelter locations, or any emergency situation.";
    } else {
      reply = "I'm your emergency assistant. I can help with flood safety, earthquake preparedness, fire evacuation, first aid, and shelter locations. What do you need help with?";
    }

    return { reply };
  }
}

module.exports = new AIService();
